# docker-mycli

A minimal Docker image for [mycli](https://github.com/dbcli/mycli), a command-line interface for MySQL with auto-completion and syntax highlighting.

![Build Status](https://github.com/vladtara/docker-mycli/actions/workflows/build_and_push.yml/badge.svg)

## Features

- Based on `python:3.13.5-alpine3.22` for a small footprint
- Installs `mycli` **version 1.31.2** along with its dependencies for a fast and interactive MySQL CLI experience
- Automated builds and publishing via GitHub Actions

## Usage

### Pull from GitHub Container Registry

```sh
docker pull ghcr.io/vladtara/docker-mycli:latest
```

### Run mycli

```sh
docker run --rm -it ghcr.io/vladtara/docker-mycli \
  -h <host> -p 3306 -u <user> <database>
```

Replace `<host>`, `<user>`, and `<database>` with your MySQL connection details.

### Example

```sh
export HOSTDB="localhost"
export USERDB="root"
export DATABASE="mydatabase"
export PORTDB=3306

docker run --rm -it ghcr.io/vladtara/docker-mycli \
  -h $HOSTDB -p $PORTDB -u $USERDB $DATABASE
```

For more details:

```
$ docker run --rm -it ghcr.io/vladtara/docker-mycli
Usage: mycli [OPTIONS] [DATABASE]

  A MySQL terminal client with auto-completion and syntax highlighting.

  Examples:
    - mycli my_database
    - mycli -u my_user -h my_host.com my_database
    - mycli mysql://my_user@my_host.com:3306/my_database

Options:
  -h, --host TEXT               Host address of the database.
  -P, --port INTEGER            Port number to use for connection. Honors
                                $MYSQL_TCP_PORT.

  -u, --user TEXT               User name to connect to the database.
  -S, --socket TEXT             The socket file to use for connection.
  -p, --password TEXT           Password to connect to the database.
  --pass TEXT                   Password to connect to the database.
  --ssh-user TEXT               User name to connect to ssh server.
  --ssh-host TEXT               Host name to connect to ssh server.
  --ssh-port INTEGER            Port to connect to ssh server.
  --ssh-password TEXT           Password to connect to ssh server.
  --ssh-key-filename TEXT       Private key filename (identify file) for the
                                ssh connection.

  --ssh-config-path TEXT        Path to ssh configuration.
  --ssh-config-host TEXT        Host to connect to ssh server reading from ssh
                                configuration.

  --ssl                         Enable SSL for connection (automatically
                                enabled with other flags).
  --ssl-ca PATH                 CA file in PEM format.
  --ssl-capath TEXT             CA directory.
  --ssl-cert PATH               X509 cert in PEM format.
  --ssl-key PATH                X509 key in PEM format.
  --ssl-cipher TEXT             SSL cipher to use.
  --tls-version [TLSv1|TLSv1.1|TLSv1.2|TLSv1.3]
                                TLS protocol version for secure connection.

  --ssl-verify-server-cert      Verify server's "Common Name" in its cert
                                against hostname used when connecting. This
                                option is disabled by default.

  -V, --version                 Output mycli's version.
  -v, --verbose                 Verbose output.
  -D, --database TEXT           Database to use.
  -d, --dsn TEXT                Use DSN configured into the [alias_dsn]
                                section of myclirc file.

  --list-dsn                    list of DSN configured into the [alias_dsn]
                                section of myclirc file.

  --list-ssh-config             list ssh configurations in the ssh config
                                (requires paramiko).

  -R, --prompt TEXT             Prompt format (Default: "\t \u@\h:\d> ").
  -l, --logfile FILENAME        Log every query and its results to a file.
  --defaults-group-suffix TEXT  Read MySQL config groups with the specified
                                suffix.

  --defaults-file PATH          Only read MySQL options from the given file.
  --myclirc PATH                Location of myclirc file.
  --auto-vertical-output        Automatically switch to vertical output mode
                                if the result is wider than the terminal
                                width.

  -t, --table                   Display batch output in table format.
  --csv                         Display batch output in CSV format.
  --warn / --no-warn            Warn before running a destructive query.
  --local-infile BOOLEAN        Enable/disable LOAD DATA LOCAL INFILE.
  -g, --login-path TEXT         Read this path from the login file.
  -e, --execute TEXT            Execute command and quit.
  --init-command TEXT           SQL statement to execute after connecting.
  --charset TEXT                Character set for MySQL session.
  --password-file PATH          File or FIFO path containing the password
                                to connect to the db if not specified otherwise
  --help                        Show this message and exit.
```

## Build Locally

```sh
docker build -t docker-pgcli .
```


## Continuous Integration

Docker images are automatically built and published for the `linux/amd64`, `Linux/arm64/v8`, `Linux/arm/v7`  platform using [GitHub Actions](.github/workflows/build_and_push.yml) on every push to `main`.

## License

[MIT](LICENSE)
