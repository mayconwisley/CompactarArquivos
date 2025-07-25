# CompactarLogsAtestadoDigital

## Visão Geral

**CompactarLogsAtestadoDigital** é uma ferramenta para compactar arquivos de log e, opcionalmente, excluir logs compactados antigos. O projeto foi desenvolvido para rodar como aplicação de console no `.NET Framework 4.7.2`.

## Funcionalidades

- **Compactação de Logs:** Cria um arquivo ZIP com todos os arquivos `.txt` de log em um diretório especificado, nomeando o arquivo com o ano e mês atual.
- **Exclusão de Arquivos Antigos:** Opcionalmente, exclui arquivos ZIP mais antigos que uma quantidade de dias definida.

## Como Usar

Execute o aplicativo via linha de comando com os seguintes parâmetros:
 ```
  CompactarLogsAtestadoDigital.exe <DiretorioLog> [del <Dias>]
 ```
### Parâmetros

- `<DiretorioLog>`: (Obrigatório) Caminho para o diretório onde estão os arquivos de log.
- `del <Dias>`: (Opcional) Se informado, exclui arquivos ZIP mais antigos que `<Dias>` dias.

### Exemplos

- **Apenas compactar logs:**
  ```
    CompactarLogsAtestadoDigital.exe "C:\AtestadoDigital\Log"
  ```
- **Compactar logs e excluir arquivos ZIP com mais de 30 dias:**
 ```
    CompactarLogsAtestadoDigital.exe "C:\AtestadoDigital\Log" del 30
 ```

## Funcionamento

1. **Compactação:** Todos os arquivos `.txt` do diretório informado são adicionados a um arquivo ZIP chamado `{yyyy_MM} Logs Compentencia.zip`.
2. **Exclusão:** Se o parâmetro `del <Dias>` for informado, todos os arquivos `.zip` do diretório com mais de `<Dias>` dias são excluídos.

## Requisitos

- .NET Framework 4.7.2
- Sistema Operacional Windows

## Licença

Este projeto está licenciado sob a Licença MIT.

## Autor

Copyright © 2025
