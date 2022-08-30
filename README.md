[Acessar aplicação](https://business-contact.herokuapp.com/) - Deploy feito no Heroku

# Setup 

  **Requerimentos**
  - MySql8
    - Se utilizar docker, pode utilizar [este repositório](https://github.com/otaviocorrea/infra)
  - Ruby 3.1.2

  **Configuração**
  ```bash
  λ bundle install
  λ rails db:create db:migrate db:seed #ou rails db:setup
  ```

  **Executar**
  ```bash
  λ rails s
  ```

# Testes
 ```bash
 λ bundle exec rspec
 ```

# Descrição

  Nesta aplicação foram criadas 3 models que são a base do do sistema e se relacionam entre si, para cada uma delas criei validações necessarias para os campos (tipo de dado, unicidade, formatação e etc...).

  Também foram criadas controllers para as views e também para uma breve consulta de dados via endpoints, que são usados na tela de visualizar um Contato, pois ela permite editar dinamicamente a relação com as Propriedades produtivas.

  O layout da aplicação foi construido com o auxilio de Bootstrap para acelerar o processo de criação de um dashboard.

  Foi adicionado o Rspec e tambem o Faker para a criação e execução dos testes unitários da aplicação, devido a minha limitação de tempo, foquei mais nos testes de Model para garantir melhor funcionamento possivel das entidades da aplicação e evitar qualquer tipo de dano ao banco de dados.

  No mais destaco a validação de limite de propriedades produtivas pois existem algumas limitações padrões nas validações do rails que faziam a mesma falhar e tive que buscar alguma forma de garantir o funcionamento correto e também o calculo do numero de plantas, pois este devia considerar a unidade de medida da coluna antes de calcular, tornando ele levemente mais complexo do que parecia.

  Para esta aplicação também foi configurada uma pipeline de CI integrada com o Github Actions que valida o codigo comitado e caso o CI passe, é automaticamente feito o deploy para o Heroku por meio da integração com o github.

  PS: Neste momento a tela de login não tem funcionalidade real, pois foquei em resolver primeiro os desafios propostos, a tela ficou apenas por estetica, também faltaram alguns detalhes como paginação e filtros mais completos para todas as telas

# Complemento

  Gravei dois videos, um para apresentar a Aplicação funcionando e outro para comentar um pouco do Backend, caso queiram assistirs, seguem os links abaixo:

  - [Apresentação da Aplicação](https://youtu.be/VQ28yRvQZAk)
  - [Apresentação Backend](https://youtu.be/BWzWtdL_bR4)
