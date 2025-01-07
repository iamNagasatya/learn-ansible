# Ansible Ad-hoc Commands

## Ping module
```sh
ansible all -m ping
```

## Command module
```sh
ansible all -m command -a "touch hello"
```

# Stat module

```sh
ansible all -m stat -a "path=hello"
```

# Yum module

```sh
ansible all -m yum -a "name=tree" -b
```

-b or --become will grant root previllage

## User module

```sh
ansible all -m user -a "name=sai" -b
```