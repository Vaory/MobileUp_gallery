# MobileUp gallery (test case/ Demichev Mikhail)
## Декомпозиция задач проекта
Актуальный статус по времени и проекту в целом можно посмотреть В Notion по ссылке:

https://www.notion.so/MobileUp-gallery-test-case-Demichev-Mikhail-9c0c2cfb3c6b45ff899a21f2a39d928d

<p float="left">
  <img src="GitScreenshots/Tasks" width="1000" />
</p>

# Использованный стэк технологий:
- Язык: Swift5, Xcode
- Фреймворки: SwiftUI, UIKit, Network, WebKit, Combine
- Архитектура: MVVM 
- Ui, дизайн, верстка: Figma
- Функционал приложения - ТЗ
- Данные приложения: VK API

# Обзор проекта
## Экран логина
При нажатии на кнопку приложение проверяет интернет-соединение и редиректит на WebView авторизации ВК.
После авторизации пользователь получает токен и перенаправляется на главную страницу приложения.

<p float="left">
  <img src="GitScreenshots/LoginView1.png" width="200" />
  <img src="GitScreenshots/LoginView2.png" width="200" />
  <img src="GitScreenshots/LoginView3.png" width="200" />
</p>

## Главный экран приложения
Кнопка выход стирает токен и возвращает на первый экран.
При нажатие на любой элемент галлереи отображается окна детального просмотра для фото или видео.

<p float="left">
  <img src="GitScreenshots/MainView1.png" width="200" />
  <img src="GitScreenshots/MainView2.png" width="200" />
</p>

## Экран "Детального просмотра" для медиа
Кнопка назад - возвращает обратно в галлерею, кнопка Share - позволяет взаимодейстовать с файлом.
При нажатии на кнопку плей в детальном вью видео окрываеться полноразмерный WebView с воспроизведенем видео и элементами управления 
<p float="left">
  <img src="GitScreenshots/DetailVIew1.png" width="200" />
  <img src="GitScreenshots/DetailView2.png" width="200" />
  <img src="GitScreenshots/DetailView3.png" width="200" />
</p>


## Экран "Share" для медиа
<p float="left">
  <img src="GitScreenshots/ShareView1.png" width="200" />
</p>
