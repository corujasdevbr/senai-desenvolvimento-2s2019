﻿using Senai.Ekips.WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.Ekips.WebApi.Repositories
{
    public class FuncionarioRepository
    {
        public List<Funcionarios> Listar()
        {
            using (EkipsContext ctx = new EkipsContext())
            {
                return ctx.Funcionarios.ToList();
            }
        }

        public Funcionarios BuscarPorId(int id)
        {
            using (EkipsContext ctx = new EkipsContext())
            {
                return ctx.Funcionarios.Find(id);
            }
        }


        public Funcionarios BuscarFuncionarioPorUsuario(int id)
        {
            using (EkipsContext ctx = new EkipsContext())
            {
                return ctx.Funcionarios.FirstOrDefault(x => x.Usuario.UsuarioId == id);
            }
        }

        public void Cadastrar(Funcionarios funcionario)
        {
            using (EkipsContext ctx = new EkipsContext())
            {
                ctx.Funcionarios.Add(funcionario);
                ctx.SaveChanges();
            }
        }

        public void Atualizar(Funcionarios funcionario)
        {
            using (EkipsContext ctx = new EkipsContext())
            {
                Funcionarios funcionarioBuscado = ctx.Funcionarios.Find(funcionario.FuncionarioId);
                funcionarioBuscado.Nome = funcionario.Nome;
                funcionarioBuscado.Cpf = funcionario.Cpf;
                funcionarioBuscado.DataNascimento = funcionario.DataNascimento;
                funcionarioBuscado.Salario = funcionario.Salario;
                funcionarioBuscado.DepartamentoId = funcionario.DepartamentoId;
                funcionarioBuscado.CargoId = funcionario.CargoId;
                ctx.Funcionarios.Update(funcionarioBuscado);
                ctx.SaveChanges();
            }
        }

        public void Deletar(int id)
        {
            using (EkipsContext ctx = new EkipsContext())
            {
                ctx.Usuarios.Remove(ctx.Usuarios.FirstOrDefault(x => x.Funcionarios.FuncionarioId == id));
                ctx.Funcionarios.Remove(ctx.Funcionarios.Find(id));
                ctx.SaveChanges();
            }
        }
    }
}
