using System;
using System.IO;

namespace CompactarArquivos
{
    internal class DeleteFile
    {
        public static void Delete(string pathFilesLogs, int days)
        {
            //Caso tenha o parametro "Del" com a "quantidade de dias" ira deletar os arquivos da quantidade de dias para trás.
            var filesDirectory = Directory.GetFiles(pathFilesLogs, "*.zip", SearchOption.TopDirectoryOnly);

            foreach (var file in filesDirectory)
            {
                FileInfo fileInfo = new FileInfo(file);

                var daysDifference = DateTime.Now.Date - fileInfo.LastWriteTime.Date;
                var differences = daysDifference.Days;
                differences += 1;

                if (differences >= days)
                {
                    File.Delete(fileInfo.FullName);
                }
            }
        }
    }
}
