# Network Diagram

## High-Level Network Flow

Remote Client
    |
    | WireGuard VPN Tunnel
    |
Mikrotik Router
    |
    | 192.168.0.0/24 Transit/LAN
    |
pfSense Firewall - 192.168.0.100
    |
    +-----------------------------+
    | SOC Zone                    |
    | 10.10.1.0/24                |
    | GitLab, Wazuh, K8s Master   |
    +-----------------------------+
    | Target Zone                 |
    | 10.10.2.0/24                |
    | DVWA, Windows AD, Client    |
    +-----------------------------+
    | Attacker Zone               |
    | 10.10.3.0/24                |
    | Kali Linux, K8s Worker      |
    +-----------------------------+

## Design Explanation

The WireGuard VPN tunnel terminates on the Mikrotik router. Remote VPN clients are assigned IP addresses from the `10.10.10.0/24` subnet.

Traffic from the VPN subnet is routed by Mikrotik toward pfSense using the transit network. pfSense then controls access into the segmented homelab networks.

This design keeps internal services private and allows secure remote administration through VPN only.
