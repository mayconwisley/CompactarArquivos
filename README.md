# CompactarArquivos

## Visão Geral

**CompactarArquivos** é uma ferramenta para compactar arquivos, opcionalmente, excluir arquivos compactados antigos. O projeto foi desenvolvido para rodar como aplicação de console no `.NET Framework 4.7.2`.

## Funcionalidades

- **Compactação de Arquivos:** Cria um arquivo ZIP com todos os arquivos em um diretório especificado, nomeando o arquivo com o ano e mês atual.
- **Exclusão de Arquivos Antigos:** Opcionalmente, exclui arquivos ZIP mais antigos que uma quantidade de dias definida.

## Como Usar

Execute o aplicativo via linha de comando com os seguintes parâmetros:
 ```
  CompactarArquivos.exe <local do arquivo> <extencao a ser compactada> <nome do arquivo compactado> [del] [30]
 ```
### Parâmetros

- `<Diretorio>`: (Obrigatório) Caminho para o diretório onde estão os arquivos.
- `<extenção do arquivo>`: (Obrigatório) Informar a extenção do arquivo a ser compactado.
- `<nome do arquivo a ser compactado>`: (Obrigatório) Informar o nome do arquivo a ser compactado.
- `del <Dias>`: (Opcional) Se informado, exclui arquivos ZIP mais antigos que `<Dias>` dias.

### Exemplos

- **Apenas compactar arquivos:**
  ```
    CompactarArquivos.exe "C:\Arquivos\Log" ".csv" "Planilhas"
  ```
- **Compactar arquivos e excluir arquivos ZIP com mais de 30 dias:**
 ```
    CompactarArquivos.exe "C:\Arquivos\Log" ".csv" "Planilhas" del 30
 ```

## Funcionamento

1. **Compactação:** Todos os arquivos com base no formato informado no paramentro `extenção do arquivo` do diretório informado são adicionados a um arquivo ZIP.
2. **Exclusão:** Se o parâmetro `del <Dias>` for informado, todos os arquivos `.zip` do diretório com mais de `<Dias>` dias são excluídos.

## Requisitos

- .NET Framework 4.7.2
- Sistema Operacional Windows

## Licença

Este projeto está licenciado sob a Licença MIT.

## Autor

Copyright © 2025
