using Microsoft.EntityFrameworkCore;
using Senai.ManualPecas.WebApi.Domains;
using Senai.ManualPecas.WebApi.Interfaces;
using Senai.ManualPecas.WebApi.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.ManualPecas.WebApi.Repositories
{
    public class PecaRepository : IPecasRepository
    {
        public void Atualizar(Pecas peca)
        {
            // TODO: Fazer
        }
        public void Cadastrar(PecaViewModel peca)
        {
            // TODO: Fazer
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                var Codigo = new SqlParameter("Codigo", peca.Codigo);
                var Descricao = new SqlParameter("Descricao", peca.Descricao);
                var Preco = new SqlParameter("Preco", peca.Preco);
                var FornecedorId = new SqlParameter("FornecedorId", peca.FornecedorId);

                // TODO: Olhar try catch
                try
                {
                    ctx.Pecas.FromSql("EXEC prAdicionaERetornaPeca @Codigo, @Descricao, @FornecedorId, @Preco",
                        Codigo, Descricao, Preco, FornecedorId).ToList();
                }
                catch
                {
                    return;
                }
            }
        }
        public void Deletar(int pecaId)
        {
            // TODO: Fazer
        }

        public List<Pecas> BuscarPorFornecedor(int fornecedorId)
        {
            // TODO: Fazer
            return null;
        }
        public List<Pecas> Listar()
        {
            // TODO: Fazer
            return null;
        }
        public List<Pecas> ListarEmOrdemCrescente()
        {
            // TODO: Fazer
            return null;
        }
    }
}
