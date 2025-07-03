# Projeto Final - Aplicativo Flutter: Login com Splash, Onboarding e Temas

Este projeto Flutter é uma aplicação completa que simula a entrada e funcionamento básico de um app real. Ele foi desenvolvido como atividade prática final da disciplina de Desenvolvimento Mobile.

## 🚀 Funcionalidades

- ✅ **Splash Screen nativa** (via `flutter_native_splash`)
- ✅ **Splash animada Flutter** com transição de escala
- ✅ **Onboarding com 3 telas**: imagem + texto descritivo
- ✅ **Tela de login funcional** com autenticação Supabase
- ✅ **Validação de formulário** com campos customizados
- ✅ **Cadastro e login com e-mail e senha**
- ✅ **Suporte a temas claro e escuro** (alternável no app)
- ✅ **Widgets personalizados reutilizáveis**
- ✅ **To-do list funcional**: criar, editar, marcar e excluir tarefas
- ✅ **Design responsivo e limpo**

---

## 🧩 Estrutura do Projeto

```plaintext
projeto_final/
├── assets/
│   └── images/                # Imagens usadas no splash e onboarding
├── lib/
│   ├── auth/                  # Lógica de autenticação
│   ├── home/                  # Tela inicial pós-login
│   ├── login/                 # Tela de login e registro
│   ├── onboarding/            # Onboarding com PageView
│   ├── themes/                # light_theme.dart, dark_theme.dart, controller
│   ├── todo/                  # Tela de lista de tarefas
│   ├── widgets/               # Widgets reutilizáveis (TextFormField, Header)
│   ├── models/                # Modelo de dados (Task)
│   └── main.dart              # Ponto de entrada da aplicação
├── pubspec.yaml
├── README.md
