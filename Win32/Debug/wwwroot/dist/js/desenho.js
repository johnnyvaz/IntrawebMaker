

     function ocultaNav() {
        var node = document.getElementById("nav")
        while (node.firstChild)
        node.removeChild(node.firstChild)
        node.remove()
    }
    function ocultaRodape() { 
        var rodape = document.getElementById("rodape")
        while (rodape.firstChild)
        rodape.removeChild(rodape.firstChild)
        rodape.remove()
        
    }

