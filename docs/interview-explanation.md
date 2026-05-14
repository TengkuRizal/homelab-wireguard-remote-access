# Interview Explanation

## Project Summary

I implemented secure remote access into my segmented DevOps and DevSecOps homelab using WireGuard VPN on Mikrotik.

The homelab contains multiple segmented networks including SOC, Target, and Attacker zones. Internal services such as Proxmox, GitLab, Kubernetes, Wazuh, Security Onion, and monitoring dashboards are not exposed directly to the internet. Instead, they are accessed securely through a WireGuard VPN tunnel.

## Architecture

The WireGuard VPN tunnel terminates on the Mikrotik router. VPN clients receive an IP address from the `10.10.10.0/24` subnet.

Mikrotik routes traffic to the internal homelab networks through pfSense, which acts as the firewall gateway for segmented lab networks.

## What I Implemented

- WireGuard VPN endpoint on Mikrotik
- VPN client access using key-based authentication
- Static routing from VPN subnet to internal homelab networks
- pfSense firewall control for segmented networks
- Split-tunnel VPN access to internal subnets
- Connectivity validation using ping, SSH, curl, and traceroute
- Documentation of access matrix, firewall rules, and troubleshooting steps

## Why This Matters

This setup simulates a real-world secure remote access design used by companies to protect internal infrastructure. Instead of exposing admin panels directly to the internet, access is restricted through VPN and controlled by firewall rules.

## Skills Demonstrated

- VPN implementation
- Mikrotik configuration
- pfSense firewall design
- Static routing
- Network segmentation
- Secure remote administration
- Troubleshooting
- Infrastructure documentation

## Interview Summary

I designed and implemented a secure WireGuard VPN remote access solution for my segmented homelab. The setup allows me to securely administer internal DevOps and security platforms such as Proxmox, GitLab, Kubernetes, Wazuh, and Security Onion without exposing them publicly.

This project demonstrates practical knowledge of secure remote access, routing, firewall control, and production-style infrastructure documentation.
