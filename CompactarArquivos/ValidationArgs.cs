using System.IO;

namespace CompactarArquivos
{
    internal static class ValidationArgs
    {
        public static void Validation(string[] args)
        {
            // Verifica se tem o parametro de entra
            if (args.Length > 0 && args.Length < 6)
            {
                string pathFilesLogs = args[0];
                string fileExtension = args[1];
                string fileName = args[2];
                string deleteFiles = args.Length == 5 ? args[3].ToLower() : string.Empty;
                string diasDelete = args.Length == 5 ? args[4] : string.Empty;

                if (!string.IsNullOrEmpty(deleteFiles))
                {
                    int diasDeleteInt = int.Parse(diasDelete);
                    ProcessDeleteFile(pathFilesLogs, diasDeleteInt);
                }

                if (Path.IsPathRooted(pathFilesLogs))
                {
                    ProcessCompactLog(pathFilesLogs, fileExtension, fileName);
                }
            }
            else
            {
                return;
            }
        }

        private static void ProcessCompactLog(string pathFilesLogs, string fileExtension, string fileName)
        {
            CompactLog.Compact(pathFilesLogs, fileExtension, fileName);
        }
        private static void ProcessDeleteFile(string pathFilesLogs, int days)
        {
            DeleteFile.Delete(pathFilesLogs, days);
        }
    }
}
