function fix-autologin --description 'Configure automatic login for the current user on tty1'
    set TARGET_USER $LOGNAME
    set CONF_DIR "/etc/systemd/system/getty@tty1.service.d"
    set CONF_FILE "$CONF_DIR/override.conf"

    if test -z "$TARGET_USER"
        echo "Error: Could not determine the current username."
        return 1
    end

    # Check if the configuration file already exists
    if test -f $CONF_FILE
        echo "Warning: Autologin configuration file already exists at $CONF_FILE"
        read -l -P "Do you want to overwrite it? [y/N] " confirm
        switch (string lower "$confirm")
            case y yes
                echo "Overwriting configuration..."
            case '*'
                echo "Aborted. No changes were made."
                return 0
        end
    end

    echo "Configuring autologin for user: $TARGET_USER"

    if not sudo mkdir -p $CONF_DIR
        echo "Error: Failed to create directory $CONF_DIR"
        return 1
    end

    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noclear --autologin %s %%I \$TERM\n" $TARGET_USER | sudo tee $CONF_FILE > /dev/null

    if test $status -ne 0
        echo "Error: Failed to write configuration to $CONF_FILE"
        return 1
    end

    echo "Reloading systemd daemon..."
    if sudo systemctl daemon-reload
        echo "Success: Autologin configured. Configuration saved to $CONF_FILE"
    else
        echo "Warning: File written, but systemctl daemon-reload failed."
    end
end
