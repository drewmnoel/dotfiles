tunip_prompt_info() {
        ip addr show tun0 | grep "inet " | awk '{print $2}' | cut -f1 -d'/' 2>/dev/null
}
