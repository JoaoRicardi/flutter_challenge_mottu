# Desafio Mottu
#### Requisitos para rodar o app
 - Flutter (2.5.10)
 - npm (8.6.0)
 -
 #### Como rodar o app:
O app utiliza flavor para gerenciar ambientes de desenvolvimento. Para que possamos alem de ter configurações especificas para cada. Para consultar flavors disponiveis podemos olhar o:
 no Android:
```sh
android/app/build.gradle
```
 no iOS:
```sh
project.pbxproj
```
ou pelo Xcode (para melhor visualização).



## Sobre o projeto:

### Funcionalidades
 ### _Airplane Mode_
  Consome apartir de um broadcast receiver o status da troca do modo avião. Caso o usuário troco o status e esteja habilitado o mesmo aparece um floating com um feeback de ativo ou inativo.
  Para passar a consumir precisamos primeiro habilitar o fluxo, dando  a permissão quando solicitado.

### _Connection_
  Consome um callback, apartir de um broadcast reciver, que caso dada a permissão, ao trocar a forma de conexão passa aparecer uma appbar com a descrição.

### Estrutura
 ### _Arquitetura_
 O projeto utiliza MVC com o MOBX como gerenciamento de estado.

 No projeto temos as seguintes camadas:
    - Views
    - Controllers
    - Repositories/Channels


> Views
Quem lida com UI, exibição de status de erro/loading, definde os componentes que devem ou não ser exibidos.

> Controllers
Lida com regras de negócio e validações. Sempre quem consome a camada de repositories/channels.

> Repositories/Channels
Lida com o consumo de informações sejam remotas ou locais/do device.

### Organização de pastas
Seguimos com uma implementação baseada em clean archtecture. Aonde cada um tem sua responsabilidade específica e é independente de sua implementação.
Por meio de interfaces e injeção de dependencias facilita-se a troca da implementação uma fez que o 'contrato' é garantido.

### Testes
Para os testes foram utilizados tanto a sdk do flutter quanto o mocktail uma vez que simplifica o retorno metodo por innterface.
Foram testadas as camadas de :
 - Views
 - Channels

ps: Os testes das controllers acabei optando por não realizar uma vez que não tantas validções em regras de negócio e parte das mesmas (devido a sua simplicidade) são testadas quanto testamos os channels.


### Extras
O projeto contem estrutura já pronta para ser anexado ao firebase, uma fez que os arquivos de configuração podem ser baixados e alocados nas pastas corretas para rodar já com a feature.
Temos tambem os githooks implementados via lefthook portanto em todo pré commit e pre push algumas validações a nível de lint/testes serão executados e barrados caso encontrado algum erro.