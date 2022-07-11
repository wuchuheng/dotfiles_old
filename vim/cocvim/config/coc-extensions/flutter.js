const { commands, workspace, window } = require('coc.nvim')

const debounce = (callback, wait) => {
    let timer = 0
    return () => {
        timer && clearTimeout(timer)
        timer = setTimeout(() => {
            callback()
        }, wait)
    }
}


exports.activate = context => {
    let { nvim } = workspace
    // context.subscriptions.push(commands.registerCommand('code.convertCodePoint', async () => {
    //
    //   let [pos, line] = await nvim.eval('[coc#util#cursor(), getline(".")]')
    //   let curr = pos[1] == 0 ? '' : line.slice(pos[1], pos[1] + 1)
    //   let code = curr.codePointAt(0)
    //   let str = code.toString(16)
    //   str = str.length == 4 ? str : '0'.repeat(4 - str.length) + str
    //   let result = `${line.slice(0, pos[1])}${'\\u' + str}${line.slice(pos[1] + 1)}`
    //   await nvim.call('setline', ['.', result])
    //
    // }))
    const onTyping = debounce(() => {
        const command = 'flutter.dev.hotReload'
        if(commands.has(command)) {
            nvim.command(`w | CocCommand ${command}`)
        }
    }, 500)

    workspace.onDidChangeTextDocument(async e => {
        const {uri} = e.textDocument
        if(uri && uri.length > 0) {
           const [,extension]= uri.split('.')
            extension === 'dart' && onTyping()
        }
    }, null, [])
}


