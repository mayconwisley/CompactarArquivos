using System;

namespace CompactarArquivos
{
    internal class Program
    {
        static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                Console.WriteLine("É necessário informar paramentros de inicialização.");
                Console.WriteLine("<local do arquivo> <extencao a ser compactada> <nome do arquivo compactado> [del] [30]");
                Console.WriteLine("Exemplo: 'C:\\Arquivos\\Log' '.csv' 'Planilhas'");
                Console.WriteLine("4º e 5º parametro opcional: para deletar os arquivos mais antigos");
                Console.WriteLine("Exemplo: 'del 30' ira deletar os arquivos com mais de 30 dias");
                Console.WriteLine("Exemplo Completo: ''C:\\Arquivos\\Log' '.csv' 'Planilhas' del 30' ira compactar os arquivos e deletar os arquivos com mas de 30 dias");

                Console.ReadKey();
            }

            ValidationArgs.Validation(args);
        }
    }
}
