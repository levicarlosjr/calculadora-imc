# 🧮 Calculadora de IMC

Uma calculadora de Índice de Massa Corporal (IMC) desenvolvida em Flutter, com interface moderna e responsiva para web, mobile e desktop.

## Funcionalidades
✅ **Calculo IMC baseado** em peso e altura
🎨 **Interface intuitiva** com design moderno
📱 **Responsivo** para web, mobile e desktop
🔢 **Validação** de dados de entrada
🎯 **Classificação** automática segundo critérios da OMS
📊 **Tabela de referência** integrada
🌈 **Cores dinâmicas** baseadas na classificação
🧹 **Função limpar** campos

## 🚀 deploy online

**aplicação:** [https://levicarlosjr.github.io/calculadora-imc/](https://levicarlosjr.github.io/calculadora-imc/)

## ⚠️ **Importante: Limitações do IMC**

> **O IMC é uma medida simples e prática para avaliar o peso em relação à altura, mas não leva em conta fatores como massa muscular, distribuição de gordura, idade, sexo e composição corporal.**
> 
> Portanto, o IMC não reflete com precisão a saúde de pessoas muito musculosas, idosos ou crianças. Assim como cada pessoa é única, cada corpo também é!
> 
> **Para uma avaliação mais completa, consulte um profissional de saúde** para considerar todos esses fatores. Lembre-se: o mais importante é como você se sente e cuida do seu corpo! 💪❤️

## 📊 IMC (OMS)

| IMC | Classificação | Status |
|-----|---------------|--------|
| < 18.5 | Baixo peso | 🔵 |
| 18.5 - 24.9 | Peso normal | 🟢 |
| 25.0 - 29.9 | Sobrepeso | 🟠 |
| 30.0 - 34.9 | Obesidade grau I | 🟠 |
| 35.0 - 39.9 | Obesidade grau II | 🔴 |
| ≥ 40.0 | Obesidade grau III | 🔴 |

## 🛠️ Tecnologias Utilizadas

- **Flutter** 3.35.4
- **Dart** 
- **GitHub Actions** (Deploy automático)
- **GitHub Pages** (Hospedagem)

## 📱 Plataformas Suportadas

- ✅ **Web** 
- ✅ **Android** 
- ✅ **iOS**
- ✅ **Windows**
- ✅ **macOS** 
- ✅ **Linux**

## 🚀 Como executar localmente

### Pré-requisitos
- Flutter SDK 3.35.4+
- Dart SDK
- Git

### Comandos
```bash
          # Clone o repositório
           git clone https://github.com/levicarlosjr/calculadora-imc.git
          # Entre na pasta
           cd calculadora-imc
          # Instale as dependências
           flutter pub get
          # Execute em modo debug
           flutter run
          # Para web especificamente
           flutter run -d chrome
          # Para build de produção (web)
           flutter build web
```

## 🌐 Deploy
Este projeto usa **GitHub Actions** para deploy automático no **GitHub Pages**. 

A cada push na branch `main`:
1. 🔨 Compila o projeto Flutter para web
2. 📦 Gera os arquivos estáticos  
3. 🚀 Deploy automático no GitHub Pages

## 📁 Estrutura do Projeto

```
calculadora-imc/
├── lib/
│   └── main.dart           # Código principal da aplicação
├── web/                    # Configurações web
├── .github/
│   └── workflows/
│       └── deploy.yml      # Workflow de deploy automático
├── pubspec.yaml            # Dependências Flutter
└── README.md               # Documentação
```

## 🤝 Como Contribuir

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👨‍💻 Autor

**Levi Carlos Jr** - [@levicarlosjr](https://github.com/levicarlosjr)

