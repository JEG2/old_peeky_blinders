# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :peeky_blinders, target: Mix.target()

# Customize non-Elixir parts of the firmware. See
# https://hexdocs.pm/nerves/advanced-configuration.html for details.

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"

# Use shoehorn to start the main application. See the shoehorn
# docs for separating out critical OTP applications such as those
# involved with firmware updates.

config :shoehorn,
  init: [:nerves_runtime, :nerves_init_gadget],
  app: Mix.Project.config()[:app]

# Use Ringlogger as the logger backend and remove :console.
# See https://hexdocs.pm/ring_logger/readme.html for more information on
# configuring ring_logger.

config :logger, backends: [RingLogger]

if Mix.target() != :host do
  import_config "target.exs"
end

config :nerves_init_gadget,
  mdns_domain: "peekyblinders.local",
  node_name: "peeky_blinders",
  node_host: :mdns_domain,
  ifname: "wlan0",
  address_method: :dhcp

# Configure wireless settings

key_mgmt = System.get_env("NERVES_NETWORK_KEY_MGMT") || "WPA-PSK"

config :nerves_network, :default,
  wlan0: [
    ssid: System.get_env("SSID"),
    psk: System.get_env("PSK"),
    key_mgmt: String.to_atom(key_mgmt)
  ]

# When we deploy to a device, we use the "prod" configuration:
import_config "../../peeky_blinders_ui/config/config.exs"

config :peeky_blinders_ui, PeekyBlindersUiWeb.Endpoint,
  # Nerves root filesystem is read-only, so disable the code reloader
  code_reloader: false,
  http: [port: 80],
  # Use compile-time Mix config instead of runtime environment variables
  load_from_system_env: false,
  # Start the server since we're running in a release instead of through `mix`
  server: true,
  url: [host: "peekyblinders.local", port: 80]

config :peeky_blinders_ui, :command_interpreter, PeekyBlinders.RunCommand
