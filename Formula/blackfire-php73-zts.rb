#encoding: utf-8

require File.expand_path("../../Abstract/abstract-blackfire-php-extension", __FILE__)

class BlackfirePhp73Zts < AbstractBlackfirePhpExtension
    init
    homepage "https://blackfire.io"
    version '1.24.4'

    url 'http://packages.blackfire.io/homebrew/blackfire-php_1.24.4-darwin_amd64-php73-zts.tar.gz'
    sha256 'fbfb46774f422dba95d93580c3c87a649114d9c0fddfb5d042c1d4d01402b6b6'

    def install
        prefix.install "blackfire.so"
        write_config_file
    end

    def config_file
        super + <<~EOS
        blackfire.agent_socket = unix:///usr/local/var/run/blackfire-agent.sock
        blackfire.agent_timeout = 0.25
        ;blackfire.log_level = 3
        ;blackfire.log_file = /tmp/blackfire.log

        ;Sets fine-grained configuration for Probe.
        ;This should be left blank in most cases. For most installs,
        ;the server credentials should only be set in the agent.
        ;blackfire.server_id =

        ;Sets fine-grained configuration for Probe.
        ;This should be left blank in most cases. For most installs,
        ;the server credentials should only be set in the agent.
        ;blackfire.server_token =
        EOS
    end
end
