# Framework Architecture

## System Design Overview

The AI Security Evaluation Framework employs a three-layer detection architecture designed to identify prompt injection attacks that may evade single-layer detection systems.

## Architecture Diagram
```
┌───────────────────────────────────────────────────────┐
│   AI Agent Under Test (Isolated Docker Container)    │
│                                                        │
│   User Prompt → AI Agent → Code Execution            │
│   Configuration Processing → Command Execution        │
└───────────────────────────────────────────────────────┘
                          ↓
┌───────────────────────────────────────────────────────┐
│     Monitoring Layer - All Operations Intercepted     │
└───────────────────────────────────────────────────────┘
         ↓                ↓                  ↓
┌────────────────┐ ┌─────────────┐ ┌─────────────────┐
│   Network      │ │ Behavioral  │ │ File Integrity  │
│   Traffic      │ │  Analysis   │ │   Validation    │
│   Monitor      │ │             │ │                 │
└────────────────┘ └─────────────┘ └─────────────────┘
         ↓                ↓                  ↓
┌───────────────────────────────────────────────────────┐
│          Comprehensive Security Analysis              │
│              SAFE / UNSAFE Determination              │
└───────────────────────────────────────────────────────┘
```

## Detection Layers

### Layer 1: Network Traffic Monitoring

**Purpose**: Detect data exfiltration through network connections

**Implementation**:
- Traffic interception using mitmproxy
- HTTP/HTTPS request logging and analysis
- Domain and IP address monitoring
- Payload content inspection

**Performance**: Average detection time ~250ms

### Layer 2: Behavioral Analysis

**Purpose**: Identify anomalous AI agent behavior patterns

**Implementation**:
- System-level process tracing
- Command execution monitoring
- File access tracking
- System call analysis

**Monitored Activities**:
- User enumeration commands (whoami, id, hostname)
- System information gathering (uname, env)
- Sensitive file access (/etc/passwd, ~/.ssh/*)
- Network tool usage (curl, wget, nc)

**Performance**: Average detection time ~1.8s

### Layer 3: File Integrity Validation

**Purpose**: Detect unauthorized file system modifications

**Implementation**:
- Pre-execution baseline establishment
- SHA256 checksum comparison
- File count and structure validation
- Permission change detection

**Performance**: Average detection time ~3.4s

## Multi-Layer Redundancy

**Coverage Statistics**:
- 86.1% of attacks detected by network layer alone
- 65.0% of attacks detected by behavioral layer alone
- 55.5% of attacks detected by integrity layer alone
- **79.4% of attacks detected by multiple layers simultaneously**

This redundancy provides fault tolerance and increased detection confidence.

## Security Isolation

**Container Isolation Measures**:
- No network access to host system
- Ephemeral file systems (destroyed after test)
- No real credentials or sensitive data
- Controlled external domain access only

---

This architecture balances detection accuracy, performance efficiency, and practical deployability for systematic AI security evaluation.
