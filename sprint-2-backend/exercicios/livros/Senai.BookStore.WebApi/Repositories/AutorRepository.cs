using Senai.BookStore.WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.BookStore.WebApi.Repositories
{
    public class AutorRepository
    {

        // String de conexão
        private string StringConexao = "Data Source = localhost; Initial Catalog = BookStore; Integrated Security = True";
        //private string StringConexao = "Data Source=.\SqlExpress; Initial Catalog=BookStore;User Id=sa;Pwd=132";

        public List<AutorDomain> Listar()
        {
            // Declara a lista onde será armazenado os valores retornados
            List<AutorDomain> autores = new List<AutorDomain>();

            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                // Declara a instrução a ser executada
                string query = "SELECT * FROM Autores";
                // Abre a conexão
                con.Open();
                // Declara um SqlDataReader que armazenará os valores recuperados
                SqlDataReader sdr;

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    sdr = cmd.ExecuteReader();

                    while (sdr.Read())
                    {
                        AutorDomain autor = new AutorDomain
                        {
                            IdAutor = Convert.ToInt32(sdr["IdAutor"]),
                            Nome = sdr["Nome"].ToString(),
                            Email = sdr["Email"].ToString(),
                            Ativo = (bool) sdr["Ativo"],
                            DataNascimento = (DateTime) sdr["DataNascimento"]
                        };

                        autores.Add(autor);
                    }
                }
            }
            return autores;
        }

        //public void Cadastrar(GeneroDomain genero)
        //{
        //    using (SqlConnection con = new SqlConnection(StringConexao))
        //    {
        //        // Declara a instrução a ser executada
        //        string query = "INSERT INTO Generos (Descricao) VALUES (@Descricao)";
        //        // Declara um novo comando
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        // Passa para o comando os parâmetros a serem alterados na string query
        //        cmd.Parameters.AddWithValue("@Descricao", genero.Descricao);
        //        // Abre a conexão
        //        con.Open();
        //        //Executa o comado
        //        cmd.ExecuteNonQuery();
        //    }
        //}
    }
}
