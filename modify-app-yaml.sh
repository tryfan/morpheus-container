guacamole_config="
        guacamole:
          host: guacd
"
appYamlErb="/opt/morpheus/embedded/cookbooks/morpheus-solo/templates/default/application.yml.erb"

if $(grep -qF "guacamole" "$appYamlErb"); then
  echo "guacd is in application.yml"
else
  echo "adding guacd to application.yml"
  printf "%s\n" "$guacamole_config" >> "$appYamlErb"
fi
