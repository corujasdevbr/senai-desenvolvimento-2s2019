using Microsoft.EntityFrameworkCore;
using Senai.ManualPecas.WebApi.Domains;
using Senai.ManualPecas.WebApi.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.ManualPecas.WebApi.Repositories
{
    public class PecaRepository : IPecasRepository
    {
        public void Atualizar(Pecas peca)
        {
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                ctx.Pecas.Update(peca);
                ctx.SaveChanges();
            }
        }

        public void Cadastrar(Pecas peca)
        {
        }

        public void Deletar(Pecas peca)
        {
        }

        public List<Pecas> ListaCrescente()
        {
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                return ctx.
            }
        }

        public List<Pecas> ListaPorFornecedor(int id)
        {
            return null;
        }

        public List<Pecas> Listar()
        {
            return null;
        }
    }
}
