using System.IO;
using System.IO.Compression;

namespace CompactarArquivos
{
    internal static class CompactLog
    {
        public static void Compact(string pathFilesLogs, string fileExtension, string fileName)
        {
            string zipPath = Path.Combine(pathFilesLogs, $@"{fileName}.zip");
            var filesDirectory = Directory.GetFiles(pathFilesLogs, $"*{fileExtension}", SearchOption.TopDirectoryOnly);

            // Cria um arquivo zip vazio
            using (FileStream zipToOpen = new FileStream(zipPath, FileMode.Create))
            {
                using (ZipArchive archive = new ZipArchive(zipToOpen, ZipArchiveMode.Create))
                {
                    foreach (var file in filesDirectory)
                    {
                        // Adiciona arquivos individualmente
                        archive.CreateEntryFromFile(file, Path.GetFileName(file));
                    }
                }
            }
        }
    }
}
