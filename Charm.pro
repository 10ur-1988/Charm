#!android: error("Building Charm with QMake is not supported, and used only for Qt/Android experiments. For everything else, please use the CMake build system.")

QT += core gui xml sql network qml quick sensors xml #dbus

INCLUDEPATH += Core/
INCLUDEPATH += Charm/

TARGET = AndCharm
TEMPLATE = app
RESOURCES = Charm/CharmResources.qrc

DEFINES += 'CHARM_VERSION=\'\"0.1a\"\''
DEFINES += 'CHARM_IDLE_TIME=0'
DEFINES += QT_NO_DBUS QT_NO_PRINTER
#DEFINES += QT_NO_PRINTER

SOURCES += \
    Charm/main.cpp \
    Charm/Data.cpp \
    Charm/EventModelAdapter.cpp \
    Charm/EventModelFilter.cpp \
    Charm/TaskModelAdapter.cpp \
    Charm/ViewFilter.cpp \
    Charm/WeeklySummary.cpp \
    Charm/Idle/IdleDetector.cpp \
    Core/CharmCommand.cpp \
    Core/CharmConstants.cpp \
    Core/CharmDataModel.cpp \
    Core/CharmExceptions.cpp \
    Core/Configuration.cpp \
    Core/Controller.cpp \
    Core/Dates.cpp \
    Core/Event.cpp \
    Core/SmartNameCache.cpp \
    Core/SqLiteStorage.cpp \
    Core/SqlRaiiTransactor.cpp \
    Core/SqlStorage.cpp \
    Core/State.cpp \
    Core/Task.cpp \
    Core/TaskListMerger.cpp \
    Core/TaskTreeItem.cpp \
    Core/TimeSpans.cpp \
    Core/XmlSerialization.cpp

HEADERS += \
    Charm/MakeTemporarilyVisible.h \
    Charm/EventModelAdapter.h \
    Charm/EventModelFilter.h \
    Charm/Idle/IdleDetector.h \
    Charm/Uniquifier.h \
    Charm/ViewModeInterface.h \
    Charm/GUIState.h \
    Charm/UndoCharmCommandWrapper.h \
    Charm/ViewFilter.h \
    Charm/ApplicationFactory.h \
    Charm/WeeklySummary.h \
    Charm/TaskModelAdapter.h \
    Charm/Data.h \
    Core/CharmCommand.h \
    Core/CharmConstants.h \
    Core/CharmDataModelAdapterInterface.h \
    Core/CharmDataModel.h \
    Core/CharmExceptions.h \
    Core/CommandEmitterInterface.h \
    Core/Configuration.h \
    Core/Controller.h \
    Core/ControllerInterface.h \
    Core/Dates.h \
    Core/Event.h \
    Core/EventModelInterface.h \
    Core/Installation.h \
    Core/MySqlStorage.h \
    Core/SmartNameCache.h \
    Core/SqLiteStorage.h \
    Core/SqlRaiiTransactor.h \
    Core/SqlStorage.h \
    Core/State.h \
    Core/StorageInterface.h \
    Core/Task.h \
    Core/TaskListMerger.h \
    Core/TaskModelInterface.h \
    Core/TaskTreeItem.h \
    Core/TimeSpans.h \
    Core/User.h \
    Core/ViewInterface.h \
    Core/XmlSerialization.h

OTHER_FILES += \
    Charm/HttpClient/HttpJob.cpp \
    Charm/HttpClient/GetProjectCodesJob.cpp \
    Charm/HttpClient/UploadTimesheetJob.cpp \
    Charm/HttpClient/GetProjectCodesJob.h \
    Charm/HttpClient/UploadTimesheetJob.h \
    Charm/HttpClient/HttpJob.h \
    Charm/ViewHelpers.cpp \
    Charm/ViewHelpers.h \
    Charm/Application.cpp \
    Charm/Application.h \
    Charm/ModelConnector.cpp \
    Charm/ModelConnector.h \
    Charm/Keychain/keychain.h \
    Charm/Keychain/keychain_p.h \
    Charm/Keychain/keychain.cpp \
    Charm/Keychain/keychain_unsecure.cpp \
    Charm/UndoCharmCommandWrapper.cpp \
    Charm/Commands/CommandRelayCommand.cpp \
    Charm/Commands/CommandModifyEvent.cpp \
    Charm/Commands/CommandDeleteEvent.cpp \
    Charm/Commands/CommandSetAllTasks.cpp \
    Charm/Commands/CommandAddTask.cpp \
    Charm/Commands/CommandModifyTask.cpp \
    Charm/Commands/CommandDeleteTask.cpp \
    Charm/Commands/CommandMakeEvent.cpp \
    Charm/Commands/CommandExportToXml.cpp \
    Charm/Commands/CommandImportFromXml.cpp \
    Charm/Commands/CommandMakeAndActivateEvent.cpp \
    Charm/Qocoa/qbutton.h \
    Charm/Qocoa/qsearchfield.h \
    Charm/ApplicationFactory.cpp \
    Charm/GUIState.cpp \
    Charm/Widgets/ActivityReport.cpp \
    Charm/Widgets/BillDialog.cpp \
    Charm/Widgets/CharmPreferences.cpp \
    Charm/Widgets/CharmReport.cpp \
    Charm/Widgets/CharmWindow.cpp \
    Charm/Widgets/CharmAboutDialog.cpp \
    Charm/Widgets/ConfigurationDialog.cpp \
    Charm/Widgets/DateEntrySyncer.cpp \
    Charm/Widgets/EnterVacationDialog.cpp \
    Charm/Widgets/EventEditor.cpp \
    Charm/Widgets/EventEditorDelegate.cpp \
    Charm/Widgets/EventView.cpp \
    Charm/Widgets/EventWindow.cpp \
    Charm/Widgets/ExpandStatesHelper.cpp \
    Charm/Widgets/IdleCorrectionDialog.cpp \
    Charm/Widgets/MessageBox.cpp \
    Charm/Widgets/MonthlyTimesheet.cpp \
    Charm/Widgets/MonthlyTimesheetConfigurationDialog.cpp \
    Charm/Widgets/ReportConfigurationDialog.cpp \
    Charm/Widgets/ReportPreviewWindow.cpp \
    Charm/Widgets/SelectTaskDialog.cpp \
    Charm/Widgets/TaskIdDialog.cpp \
    Charm/Widgets/TaskEditor.cpp \
    Charm/Widgets/TasksView.cpp \
    Charm/Widgets/TasksViewDelegate.cpp \
    Charm/Widgets/TasksWindow.cpp \
    Charm/Widgets/TimeTrackingView.cpp \
    Charm/Widgets/TimeTrackingWindow.cpp \
    Charm/Widgets/TimeTrackingTaskSelector.cpp \
    Charm/Widgets/TrayIcon.cpp \
    Charm/Widgets/Timesheet.cpp \
    Charm/Widgets/WeeklyTimesheet.cpp \
    Charm/Widgets/TasksViewDelegate.h \
    Charm/Widgets/IdleCorrectionDialog.h \
    Charm/Widgets/Timesheet.h \
    Charm/Widgets/WeeklyTimesheet.h \
    Charm/Widgets/TasksWindow.h \
    Charm/Widgets/CharmReport.h \
    Charm/Widgets/CharmWindow.h \
    Charm/Widgets/DateEntrySyncer.h \
    Charm/Widgets/MonthlyTimesheetConfigurationDialog.h \
    Charm/Widgets/TaskIdDialog.h \
    Charm/Widgets/MessageBox.h \
    Charm/Widgets/TaskEditor.h \
    Charm/Widgets/ReportConfigurationDialog.h \
    Charm/Widgets/TimeTrackingTaskSelector.h \
    Charm/Widgets/EventEditor.h \
    Charm/Widgets/TasksView.h \
    Charm/Widgets/CharmPreferences.h \
    Charm/Widgets/EnterVacationDialog.h \
    Charm/Widgets/TimeTrackingWindow.h \
    Charm/Widgets/TrayIcon.h \
    Charm/Widgets/TimeTrackingView.h \
    Charm/Widgets/ActivityReport.h \
    Charm/Widgets/EventEditorDelegate.h \
    Charm/Widgets/ExpandStatesHelper.h \
    Charm/Widgets/SelectTaskDialog.h \
    Charm/Widgets/MonthlyTimesheet.h \
    Charm/Widgets/EventWindow.h \
    Charm/Widgets/EventView.h \
    Charm/Widgets/ConfigurationDialog.h \
    Charm/Widgets/ReportPreviewWindow.h \
    Charm/Widgets/BillDialog.h \
    Charm/Widgets/CharmAboutDialog.h \
    Charm/Commands/CommandImportFromXml.h \
    Charm/Commands/CommandModifyTask.h \
    Charm/Commands/CommandAddTask.h \
    Charm/Commands/CommandExportToXml.h \
    Charm/Commands/CommandDeleteTask.h \
    Charm/Commands/CommandModifyEvent.h \
    Charm/Commands/CommandMakeAndActivateEvent.h \
    Charm/Commands/CommandSetAllTasks.h \
    Charm/Commands/CommandRelayCommand.h \
    Charm/Commands/CommandDeleteEvent.h \
    Charm/Commands/CommandMakeEvent.h \
    Charm/qml/CharmStyle.qml

CONFIG += mobility
MOBILITY =

# Disable some of the noise for now.
*-g++*|*-clang*|*-llvm* {
    QMAKE_CXXFLAGS += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function
}

# CMake works with include files named "filename.moc" while qmake expects
# "moc_filename.cpp". Since qmake does not provide any way to change that
# to the requirement we just hack around.

#new_moc.output = ${QMAKE_FILE_BASE}.moc
#new_moc.commands = moc -i -nw ${QMAKE_FILE_NAME} -o ${QMAKE_FILE_OUT}
#new_moc.depend_command = $$QMAKE_CXX -E -M ${QMAKE_FILE_NAME} | sed "s/^.*: //"
#new_moc.input = HEADERS
#QMAKE_EXTRA_COMPILERS += new_moc

MOC_HEADERS = $$HEADERS
#MOC_HEADERS -= $$files(Charm/keychain_p.h)
for(hdr, MOC_HEADERS) {
    fdir=$$dirname(hdr)
    base=$$basename(hdr)
    fname=$$section(base, ".", 0, 0)
    in=$${LITERAL_HASH}include <moc_$${fname}.cpp>
    out=$${OUT_PWD}/$${fname}.moc
    exists( $${fdir}/$${fname}.cpp ) {
        system(echo \"$$in\" > \"$$out\")
    }
}

# Create that CharmCMake.h file that is auto-created by cmake and included
# everywhere. Here we could also hard-code defines or whatever that file
# includes when cmake creates it.
system('echo "" > "$${OUT_PWD}/CharmCMake.h"')

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml \
    $$files(Charm/qml/*.qml)

