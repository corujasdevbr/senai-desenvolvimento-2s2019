using Senai.ManualPecas.WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.ManualPecas.WebApi.Interfaces
{
    interface IFornecedoresRepository
    {
        void Cadastrar(Fornecedores fornecedor);

        List<Fornecedores> ListaMaisBaratos();
    }
}
