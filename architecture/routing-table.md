# Routing Table

## Mikrotik Static Routes

The Mikrotik router routes VPN client traffic to the internal homelab networks through pfSense.

| Destination | Gateway | Purpose |
|---|---|---|
| 10.10.1.0/24 | 192.168.0.100 | SOC Zone |
| 10.10.2.0/24 | 192.168.0.100 | Target Zone |
| 10.10.3.0/24 | 192.168.0.100 | Attacker Zone |
| 10.10.10.0/24 | WireGuard Interface | VPN Clients |

## Routing Logic

Remote VPN clients connect to the Mikrotik WireGuard interface and receive an IP address from the 10.10.10.0/24 subnet.

Mikrotik forwards traffic destined for internal lab networks to pfSense. pfSense then applies firewall policies before allowing access to SOC, Target, or Attacker zones.
