using Microsoft.AspNetCore.Http;
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
    public class FornecedorRepository : IFornecedorRepository
    {
        // TODO - Remover
        ManualPecasContext ctx = new ManualPecasContext();

        public void Atualizar(Fornecedores fornecedor)
        {
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                ctx.Fornecedores.Update(fornecedor);
                ctx.SaveChanges();
            }
        }
        public void Cadastrar(Fornecedores fornecedor)
        {
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                ctx.Fornecedores.Add(fornecedor);
                ctx.SaveChanges();
            }
        }
        public Fornecedores BuscarPorCNPJeSenha(LoginViewModel login)
        {
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                Fornecedores fornecedor = ctx.Fornecedores.FirstOrDefault(x => x.Cnpj == login.Cnpj && x.Senha == login.Senha);
                if(fornecedor == null)
                    return null;

                return fornecedor;
            }
        }
        public Fornecedores BuscarPorId(int fornecedorId)
        {
            // TODO: Perguntar pra helena pq não fazer dessa forma
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                Fornecedores fornecedor = ctx.Fornecedores.FirstOrDefault(x => x.FornecedorId == fornecedorId);
                if (fornecedor == null)
                    return null;

                return fornecedor;
            }
        }
        public List<Fornecedores> BuscarMaisBaratos(int pecaId)
        { 
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                var id = new SqlParameter("id", pecaId);
                return ctx.Fornecedores.FromSql("EXEC prListaMaisBarato @id", id).ToList();
            }
        }

     
    }
}
