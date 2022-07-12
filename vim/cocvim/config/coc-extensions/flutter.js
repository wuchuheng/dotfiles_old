const { commands, workspace } = require('coc.nvim')

const debounce = (callback, wait) => {
    let timer = 0
    return () => {
        timer && clearTimeout(timer)
        timer = setTimeout(() => {
            callback()
        }, wait)
    }
}

const handleTyping = debounce(() => {
    let { nvim } = workspace
    const command = 'flutter.dev.hotReload'
    if(commands.has(command)) {
        nvim.command(`w | CocCommand ${command}`)
    }
}, 500)

exports.activate = context => {
    let { nvim } = workspace
    let isToggleOutline = false
    context.subscriptions.push(commands.registerCommand('flutter.openOutline', async () => {
        const openOutline = () => {
            const command = 'flutter.outline'
            if ( commands.has(command) ) {
                nvim.command(`CocCommand ${command}`) 
                isToggleOutline = true
            } else {
                setTimeout(openOutline, 100)
            }
        }
        !isToggleOutline && openOutline()
    }))

    workspace.onDidChangeTextDocument(async e => {
        const {uri} = e.textDocument
        if(uri && uri.length > 0) {
           const [,extension]= uri.split('.')
            extension === 'dart' && handleTyping()
        }
    }, null, [])
}


