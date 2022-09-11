local dap = require('dap')
local home = os.getenv('HOME')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { home .. '/dev/dap/vscode-php-debug/out/phpDebug.js'  }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003,
    log = true,
    pathMappings = {
        ['/var/www/html'] = "${workspaceFolder}"
    }
  }
}
