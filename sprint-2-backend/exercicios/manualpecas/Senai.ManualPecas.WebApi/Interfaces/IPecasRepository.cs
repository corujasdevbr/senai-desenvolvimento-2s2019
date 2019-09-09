using Senai.ManualPecas.WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.ManualPecas.WebApi.Interfaces
{
    interface IPecasRepository
    {
        void Cadastrar(Pecas peca);
        void Atualizar(Pecas peca);
        void Deletar(Pecas peca);

        List<Pecas> Listar();
        List<Pecas> ListaCrescente();
        List<Pecas> ListaPorFornecedor(int id);
    }
}
