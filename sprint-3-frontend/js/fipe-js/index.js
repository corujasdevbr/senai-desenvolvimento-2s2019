const marcas = document.querySelector('#marcas-carros');
const tabela = document.querySelector('#tabela-corpo');


fetch('https://parallelum.com.br/fipe/api/v1/carros/marcas')
    .then(resposta => resposta.json())
    .then(data => construirOpcoes(data))
    .catch(erro => console.log(erro));


function construirOpcoes(data){
    
    data.forEach(element =>{
        const option = document.createElement('option');

        option.textContent = element.nome;
        option.value = element.codigo;
        
        marcas.appendChild(option);
    });
}

function requisicaoTabela(){
    
    fetch('https://parallelum.com.br/fipe/api/v1/carros/marcas/'+this.value+'/modelos')
        .then(resposta => resposta.json())
        .then(data => renderizaTabela(data))
        .catch(erro => console.log(erro));
}

function renderizaTabela(data){

    while(tabela.firstChild){
        tabela.firstChild.remove();
    }

    data.modelos.forEach(element =>{
        const tr = document.createElement('tr');
        const td_codigo = document.createElement('td');
        const td_nome = document.createElement('td');

        td_codigo.textContent = element.codigo;
        td_nome.textContent = element.nome;

        tr.appendChild(td_codigo);
        tr.appendChild(td_nome);
        tabela.appendChild(tr);
    })
}

marcas.onchange = requisicaoTabela;