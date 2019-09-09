using Microsoft.EntityFrameworkCore;
using Senai.ManualPecas.WebApi.Domains;
using Senai.ManualPecas.WebApi.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.ManualPecas.WebApi.Repositories
{
    public class FornecedorRepository : IFornecedorRepository
    {
        public void Cadastrar(Fornecedores fornecedor)
        {
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                ctx.Fornecedores.Add(fornecedor);
                ctx.SaveChanges();
            }
        }

        public List<Fornecedores> ListaMaisBaratos(int id)
        {
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                 return ctx.Fornecedores.FromSql("EXEC prListaMaisBarato 2").ToList();
            }
        }
    }
}
