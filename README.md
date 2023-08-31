# QuizApp
Uma aplicação mobile desenvolvida com Flutter para a disciplina de Desenvolvimento Mobile. Consiste em um aplicativo de quiz que faz perguntas alguns tópicos específicos, salvando a quantidade de acertos no com shared preferences

- Aquila Oliveira
- Pedro Gonçalves dos Santos
- Ruan Cristyan

# Executando o aplicativo

Para o correto funcionamento do app, é necessário instalar as dependências, faça isso com:

```
flutter clean
flutter pub get
```

Para a internacionalização, caso queira adicionar mais textos, é necessário atualizar os arquivos ``l10n/intl_en.arb ou l10n/intl_pt.arb``. Exemplo l10n/intl_en.arb:
```
{
  "@@locale": "en",
  "welcomeMessage": "Welcome to Quiz-GPT",
  "answers": "{number} correct answers!",
  "movies": "Movies",
  "sports": "Sports",
  "games": "Video-Games",
  "descriptin_movie": "Test your knowledge on blockbuster movies.",
  "description_sports": "Are you a sports fan? Prove it by answering these questions!",
  "description_games": "Think you're a gaming expert? Find out her!",
  "button": "Send",
  "answerCorrect": "Correct!",
  "answerIncorrect": "Wrong!"
}
```

Deve ser colocado no final um novo campo no json com o texto da linguagem (nesse caso, em inglês) e esse novo campo deve ser chamado na tela desejada

Para a execução correta do aplicativo, é necessário gerar uma chave de API do chat gpt e colocar no arquivo ``lib/network.dart`` no campo Authorization da chamada da api. Exemplo: ``Bearer XXX``. Substitua o XXX pela chave gerada 