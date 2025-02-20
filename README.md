# Split Elixir SDK Example

This is an Elixir web application example that demonstrates how to use the [Split Elixir SDK](https://help.split.io/hc/en-us/articles/26988707417869-Elixir-Thin-Client-SDK), which connects to a [Splitd daemon](https://help.split.io/hc/en-us/articles/18305269686157-Split-Daemon-splitd) instance to evaluate feature flags and track events.

## Get started

### Run the Splitd daemon

1. Download the Splitd daemon for your specific OS and CPU Architecture. For example, to download it for MacOS with Apple Silicon and assuming you have [wget](https://www.gnu.org/software/wget/) CLI tool installed, you can run the following command:

```bash
# Download the binary
wget https://github.com/splitio/splitd/releases/download/v1.6.0/splitd-darwin-arm-1.6.0.bin

# Make it executable
chmod +x ./splitd-darwin-arm-1.6.0.bin
```

**NOTE**: check [here](https://help.split.io/hc/en-us/articles/18305269686157-Split-Daemon-splitd#1-get-a-copy-of-splitd) for other download options.

2. Update the `./split.yaml` configuration file with your Split server-side SDK Key. To get your SDK Key, sign in to your Split account, navigate to the "Admin Settings" -> "API Keys" tab, and copy the SDK Key from the "SDK API Keys" section.

3. Start the Splitd daemon by running the following command:

```bash
SPLITD_CONF_FILE=./splitd.yaml ./splitd-darwin-arm-1.6.0.bin
```

### Run the Elixir application

**Prerequisites**: install [Elixir](https://elixir-lang.org/install.html).

1. Install dependencies:

```bash
mix deps.get
```

2. Start the Elixir Web application:

```bash
mix run --no-halt
```

### Validate

- Open your browser and navigate to `http://localhost:80/feature-flag-names` to see the list of feature flags available in your Split environment.
