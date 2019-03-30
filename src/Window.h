/*
 * This file is part of the trojan project.
 * Trojan is an unidentifiable mechanism that helps you bypass GFW.
 * Copyright (C) 2018  Light Bob
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef WINDOW_H
#define WINDOW_H

#include <QWidget>
#include <QSystemTrayIcon>
#include <QMenu>
#include <QCoreApplication>
#include <QVBoxLayout>
#include <QLabel>
#include <QScrollArea>

#include "Button.h"
#include "Version.h"
#include "BodyWidget.h"
#include "StackedWidget.h"
#include "ConfigEditor.h"

class Window : public QWidget
{
  Q_OBJECT
public:
  explicit Window(QWidget *parent = nullptr);

signals:
  void startTriggered();
  void stopTriggered();

public slots:
  void setCurrentMode(const Config::RunType &t);
  void onServerStarted(const bool &sucess);
  void onRadioButtonToggled(bool serverMode);

private:
  QAction *start_action;
  QAction *show_action;
  QAction *quit_action;
  QMenu *tray_menu;
  QSystemTrayIcon *tray_icon;

  QHBoxLayout *main_layout;
  ConfigEditor *config_editor_server;
  ConfigEditor *config_editor_client;
  BodyWidget *body_widget;
  QScrollArea *scroll_area;
  QStackedWidget *stacked_widget;

  bool isEditing = false;
  bool isRunning = false;

private slots:
  void onStartButtonClicked();
  void onConfigButtonClicked();
};

#endif // WINDOW_H
