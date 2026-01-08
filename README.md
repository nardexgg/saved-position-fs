# SavePosition - SA-MP FilterScript

FilterScript para SA-MP que permite salvar a posicao do player e do veiculo em arquivos TXT.
Ideal para mapeamento e desenvolvimento de gamemodes.

## Recursos
- Salva a posicao do player
- Salva a posicao do veiculo
- Suporte a comentarios nos comandos
- Arquivos organizados em pasta
- AMX ja compilado
- Pasta de salvamento incluida

## Comandos
/savepos [comentario]  
Salva a posicao atual do player.

/saveveh [comentario]  
Salva a posicao atual do veiculo.

## Estrutura de arquivos
filterscripts/
└── SavePosition.amx

scriptfiles/
└── SavesPlayers/
    ├── Position.txt
    └── Vehicle.txt

## Instalacao
1. Copie a pasta `filterscripts` para o servidor
2. Copie a pasta `scriptfiles` para o servidor
3. Adicione no `server.cfg`:
   filterscripts SavePosition
4. Inicie o servidor

## Requisitos
- SA-MP Server
- Nenhuma compilacao necessaria

## Autor
Nardex

## Licenca
Uso livre para projetos SA-MP.
