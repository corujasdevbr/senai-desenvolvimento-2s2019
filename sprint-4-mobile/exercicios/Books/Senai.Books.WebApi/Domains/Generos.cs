using System;
using System.Collections.Generic;

namespace Senai.Books.WebApi.Domains
{
    public partial class Generos
    {
        public Generos()
        {
            Livros = new HashSet<Livros>();
        }

        public int GeneroId { get; set; }
        public string Nome { get; set; }

        public ICollection<Livros> Livros { get; set; }
    }
}
