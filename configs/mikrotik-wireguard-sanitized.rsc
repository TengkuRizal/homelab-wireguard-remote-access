# Mikrotik WireGuard Configuration - Sanitized Example
# Do not commit real private keys, public IPs, passwords, or full router exports.

# Create WireGuard interface
/interface wireguard
add name=wireguard listen-port=51820 private-key="<MIKROTIK_PRIVATE_KEY_REDACTED>"

# Assign VPN gateway IP
/ip address
add address=10.10.10.1/24 interface=wireguard comment="WireGuard VPN Gateway"

# Add WireGuard client peer
/interface wireguard peers
add interface=wireguard public-key="<CLIENT_PUBLIC_KEY_REDACTED>" allowed-address=10.10.10.2/32 persistent-keepalive=25 comment="Remote VPN Client"

# Static routes to homelab networks via pfSense
/ip route
add dst-address=10.10.1.0/24 gateway=192.168.0.100 comment="Route to SOC Zone"
add dst-address=10.10.2.0/24 gateway=192.168.0.100 comment="Route to Target Zone"
add dst-address=10.10.3.0/24 gateway=192.168.0.100 comment="Route to Attacker Zone"

# Allow WireGuard UDP port on Mikrotik
/ip firewall filter
add chain=input action=accept protocol=udp dst-port=51820 comment="Allow WireGuard VPN"

# Allow VPN subnet to access internal homelab zones
/ip firewall filter
add chain=forward action=accept src-address=10.10.10.0/24 dst-address=10.10.1.0/24 comment="Allow VPN to SOC Zone"
add chain=forward action=accept src-address=10.10.10.0/24 dst-address=10.10.2.0/24 comment="Allow VPN to Target Zone"
add chain=forward action=accept src-address=10.10.10.0/24 dst-address=10.10.3.0/24 comment="Allow VPN to Attacker Zone"
