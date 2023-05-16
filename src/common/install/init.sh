#!/bin/bash

local readonly main_sh_path=$(get_full_path $(get_main_sh_path))
if [ ! -f ${main_sh_path} ]; then
  touch ${main_sh_path}
  chmod +x ${main_sh_path}
  cat > ${main_sh_path} <<EOF
#!/bin/sh

EOF
fi
