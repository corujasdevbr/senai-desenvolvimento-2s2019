using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.ManualPecas.WebApi.Domains
{
    public class FornecedoresPecas
    {
        public Fornecedores Fornecedor { get; set; }
        public int? FornecedorId { get; set; }

        public int? PecaId { get; set; }
        public Pecas Peca { get; set; }

        public float Preco { get; set; }

    }
}
