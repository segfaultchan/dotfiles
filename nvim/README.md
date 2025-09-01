# Welcome to another nvim dotfiles

Очередная сборка nvim, ничем не отличающаяся от сотен и тысяч других. Но она лучше других. <br>
Почему? Потому что ее сделал я! <br>

...На что я трачу свою гребаную жизнь?)
## Комбинации клавиш
| Комбинация клавиш | Описание |
| ----------------- | -------- |
| Ctrl + T          | Открыть NeoTree во floating окне по центру экрана |
| Ctrl + G          | Открыть NeoTree в выпадающем окне слева |
| Ctrl + Space      | Принудительно призвать меню автодополнения |
| Ctrl + E          | Принудительно отозвать меню автодополнения |
| Up/Down, Enter    | Перемещаться по меню автодополнения, подтвердить выбор в меню автодополнения |
| Ctrl + N          | Включить/выключить отображение номеров строк |
| Ctrl + C          | Открыть floating окно с документацией |
| Ctrl + S          | Открыть терминал во floating окне по центру экрана |
| Esc               | Закрыть терминал (необходимо находиться в режиме Terminal) |
| F5                | Скомпилировать текущий C++ файл и открыть его во floating окне терминала (необходим правильный Makefile) |
| Ctrl + - (minus)  | Вставить длинное тире (работает только в режиме Insert) |
| Ctrl + @          | Вставить кавычки-елочки и переместить курсор на один символ влево (внутрь ковычек) |

## Пример допустимого Makefile
```
CC=/usr/bin/g++
CFLAGS=-Wall
LDFLAGS=-lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio
SOURCES=main.cpp
EXECUTABLE=main

all: 
	$(CC) $(CFLAGS) $(LDFLAGS) $(SOURCES) -o $(EXECUTABLE)

clean:
	rm -rf main
```


## Команды для автоматической развертки сборки
Установить сборку на свой компьютер можно, выполнив следующую команду:
```
git clone https://github.com/T385F/yet-another-nvim-dotfiles/ ~/config/nvim && rm ~/.config/nvim/README.md
```
Обновить сборку, уже установленную на компьютере, можно, выполнив следующую команду:
```
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.config/nvim && git clone https://github.com/T385F/yet-another-nvim-dotfiles/ ~/.config/nvim && rm ~/.config/nvim/README.md
```
