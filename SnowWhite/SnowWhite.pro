TEMPLATE = lib
QT += qml quick quickcontrols2
CONFIG += qt plugin

include(SnowWhite.pri)

qmltypes.target = qmltypes
qmltypes.commands = $$[QT_INSTALL_BINS]/qmlplugindump SnowWhite 1.0 $$QMAKE_RESOLVED_TARGET > $$PWD/snowwhite.qmltypes
qmltypes.depends = $$QMAKE_RESOLVED_TARGET

QMAKE_EXTRA_TARGETS += qmltypes
