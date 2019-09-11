using Senai.ManualPecas.WebApi.Domains;
using Senai.ManualPecas.WebApi.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.ManualPecas.WebApi.Interfaces
{
    interface IPecasRepository
    {
        void Cadastrar(PecaViewModel peca);
        void Atualizar(Pecas peca);
        void Deletar(int pecaId);
        List<Pecas> Listar();

        List<Pecas> ListarEmOrdemCrescente();
        List<Pecas> BuscarPorFornecedor(int fornecedorId);
    }
}
