#!/bin/bash
while true; do
    clear
    echo "================================"
    echo "       SYSTEM SETTINGS          "
    echo "================================"
    echo "1) Bluetooth Manager"
    echo "2) Wi-Fi Manager"
    echo "3) Sound Settings"
    echo "4) Screen Brightness"
    echo "5) Display Settings"
    echo "6) Exit"
    echo "================================"
    echo -n "Select option (1-6): "
    read choice
    
    case $choice in
        1)
            clear
            echo "Starting blueman..."
            bluetui
            echo ""
            echo "Press Enter to return to menu..."
            read
            ;;
        2)
            clear
            echo "Starting Wi-Fi Manager..."
            nmtui
            echo ""
            echo "Press Enter to return to menu..."
            read
            ;;
        3)
            clear
            echo "Starting Sound Settings..."
            alsamixer
            echo ""
            echo "Press Enter to return to menu..."
            read
            ;;
        4)
            clear
            echo "=== Brightness Settings ==="
            current=$(light)
            echo "Current brightness: $current%"
            echo ""
            echo "1) Increase +10%"
            echo "2) Decrease -10%"
            echo "3) Set custom value"
            echo "4) Back"
            echo -n "Choose option (1-4): "
            read subchoice
            
            case $subchoice in
                1)
                    light -A 10
                    echo "Brightness increased to $(light)%"
                    ;;
                2)
                    light -U 10
                    echo "Brightness decreased to $(light)%"
                    ;;
                3)
                    echo -n "Enter brightness (0-100): "
                    read new
                    light -S $new
                    echo "Brightness set to $(light)%"
                    ;;
                4)
                    continue
                    ;;
            esac
            echo ""
            echo "Press Enter to return to menu..."
            read
            ;;
        5)
            clear
            echo "Starting Display Settings..."
            arandr
            echo ""
            echo "Press Enter to return to menu..."
            read
            ;;
        6)
            clear
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option: $choice"
            echo "Press Enter to continue..."
            read
            ;;
    esac
done
