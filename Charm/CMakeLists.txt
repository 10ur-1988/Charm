INCLUDE_DIRECTORIES( ${Charm_SOURCE_DIR} ${Charm_BINARY_DIR} )

SET(
    CharmApplication_SRCS
    ApplicationCore.cpp
    Data.cpp
    EventModelAdapter.cpp
    EventModelFilter.cpp
    GUIState.cpp
    ModelConnector.cpp
    ViewFilter.cpp
    TaskModelAdapter.cpp
    ViewHelpers.cpp
    WeeklySummary.cpp
    UndoCharmCommandWrapper.cpp
    Commands/CommandRelayCommand.cpp
    Commands/CommandModifyEvent.cpp
    Commands/CommandDeleteEvent.cpp
    Commands/CommandSetAllTasks.cpp
    Commands/CommandAddTask.cpp
    Commands/CommandModifyTask.cpp
    Commands/CommandDeleteTask.cpp
    Commands/CommandMakeEvent.cpp
    Commands/CommandExportToXml.cpp
    Commands/CommandImportFromXml.cpp
    Commands/CommandMakeAndActivateEvent.cpp
    HttpClient/HttpJob.cpp
    HttpClient/GetProjectCodesJob.cpp
    HttpClient/UploadTimesheetJob.cpp
    Idle/IdleDetector.cpp
    Reports/TimesheetInfo.cpp
    Reports/MonthlyTimesheetXmlWriter.cpp
    Reports/WeeklyTimesheetXmlWriter.cpp
    Widgets/ActivityReport.cpp
    Widgets/BillDialog.cpp
    Widgets/CharmPreferences.cpp
    Widgets/CharmReport.cpp
    Widgets/CharmWindow.cpp
    Widgets/CharmAboutDialog.cpp
    Widgets/CommentEditorPopup.cpp
    Widgets/ConfigurationDialog.cpp
    Widgets/DateEntrySyncer.cpp
    Widgets/EnterVacationDialog.cpp
    Widgets/EventEditor.cpp
    Widgets/EventEditorDelegate.cpp
    Widgets/EventView.cpp
    Widgets/EventWindow.cpp
    Widgets/ExpandStatesHelper.cpp
    Widgets/HttpJobProgressDialog.cpp
    Widgets/IdleCorrectionDialog.cpp
    Widgets/MessageBox.cpp
    Widgets/MonthlyTimesheet.cpp
    Widgets/MonthlyTimesheetConfigurationDialog.cpp
    Widgets/ReportConfigurationDialog.cpp
    Widgets/ReportPreviewWindow.cpp
    Widgets/SelectTaskDialog.cpp
    Widgets/TaskIdDialog.cpp
    Widgets/TaskEditor.cpp
    Widgets/TasksView.cpp
    Widgets/TasksViewDelegate.cpp
    Widgets/TasksWindow.cpp
    Widgets/TimeTrackingView.cpp
    Widgets/TimeTrackingWindow.cpp
    Widgets/TimeTrackingTaskSelector.cpp
    Widgets/TrayIcon.cpp
    Widgets/Timesheet.cpp
    Widgets/WeeklyTimesheet.cpp
)

SET(CharmApplication_LIBS)

IF( CHARM_IDLE_DETECTION )
    IF( APPLE )
        LIST( APPEND CharmApplication_SRCS Idle/MacIdleDetector.mm )
    ELSEIF( WIN32 )
        LIST( APPEND CharmApplication_SRCS Idle/WindowsIdleDetector.cpp )
    ELSEIF( UNIX )
        FIND_PACKAGE( X11 )
        IF( X11_FOUND AND X11_Xscreensaver_LIB )
            MESSAGE( "X11 idle detection enabled." )
            INCLUDE_DIRECTORIES( ${X11_INCLUDE_DIR} )
            LIST( APPEND CharmApplication_SRCS Idle/X11IdleDetector.cpp )
            LIST( APPEND CharmApplication_LIBS ${X11_X11_LIB} ${X11_Xscreensaver_LIB} )
            SET( CHARM_IDLE_DETECTION_AVAILABLE_X11 "1" CACHE INTERNAL "" )
        ELSE()
            MESSAGE( "Install X11/XScreenSaver headers and library for X11 idle detection." )
        ENDIF()
    ENDIF()
ENDIF()

LIST( APPEND CharmApplication_SRCS Keychain/keychain.cpp )

IF (APPLE)
    LIST( APPEND CharmApplication_SRCS Keychain/keychain_mac.cpp MacApplicationCore.mm )

    FIND_LIBRARY( COREFOUNDATION_LIBRARY CoreFoundation )
    LIST( APPEND CharmApplication_LIBS ${COREFOUNDATION_LIBRARY} )

    FIND_LIBRARY( SECURITY_LIBRARY Security )
    LIST( APPEND CharmApplication_LIBS ${SECURITY_LIBRARY} )

    FIND_LIBRARY( APPKIT_LIBRARY AppKit )
    LIST( APPEND CharmApplication_LIBS ${APPKIT_LIBRARY} )
ELSEIF ( WIN32 )
    LIST( APPEND CharmApplication_SRCS Keychain/keychain_win.cpp )
ELSEIF ( UNIX )
    IF (HAVE_DBUS)
        LIST( APPEND CharmApplication_SRCS Keychain/keychain_dbus.cpp )
        QT_ADD_DBUS_INTERFACE( CharmApplication_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/Keychain/org.kde.KWallet.xml kwallet_interface KWalletInterface )
        LIST( APPEND CharmApplication_LIBS ${QT_QTDBUS_LIBRARY} )
    ELSE()
        LIST( APPEND CharmApplication_SRCS Keychain/keychain_unsecure.cpp )
    ENDIF()
ENDIF()

QT_WRAP_CPP( MOC_QOCOA_SRCS Qocoa/qbutton.h Qocoa/qsearchfield.h )

LIST( APPEND CharmApplication_SRCS ${MOC_QOCOA_SRCS} )
IF (APPLE)
    LIST( APPEND CharmApplication_SRCS Qocoa/qbutton_mac.mm Qocoa/qsearchfield_mac.mm )
ELSE()
    LIST( APPEND CharmApplication_SRCS Qocoa/qbutton_nonmac.cpp Qocoa/qsearchfield_nonmac.cpp )
ENDIF()

QT_WRAP_UI(
    UiGenerated_SRCS
    Widgets/CommentEditorPopup.ui
    Widgets/ConfigurationDialog.ui
    Widgets/CharmPreferences.ui
    Widgets/TaskIdDialog.ui
    Widgets/TaskEditor.ui
    Widgets/EnterVacationDialog.ui
    Widgets/EventEditor.ui
    Widgets/SelectTaskDialog.ui
    Widgets/CharmAboutDialog.ui
    Widgets/IdleCorrectionDialog.ui
    Widgets/ActivityReportConfigurationDialog.ui
    Widgets/WeeklyTimesheetConfigurationDialog.ui
    Widgets/MonthlyTimesheetConfigurationDialog.ui
    Widgets/ReportPreviewWindow.ui
)

QT_ADD_RESOURCES( Resources_SRCS CharmResources.qrc )

ADD_LIBRARY(
    CharmApplication STATIC
    ${CharmApplication_SRCS} ${UiGenerated_SRCS}
)
TARGET_LINK_LIBRARIES(CharmApplication ${CharmApplication_LIBS})

SET( Charm_SRCS Charm.cpp )

IF( APPLE )
    IF( CHARM_MAC_HIGHRES_SUPPORT_ENABLED )
        SET( MACOSX_BUNDLE_HIGHRESOLUTION_CAPABLE "true")
    ELSE()
        SET( MACOSX_BUNDLE_HIGHRESOLUTION_CAPABLE "false")
    ENDIF()
    SET( MACOSX_BUNDLE_INFO_STRING "Charm ${Charm_VERSION}" )
    SET( MACOSX_BUNDLE_BUNDLE_VERSION "Charm ${Charm_VERSION}" )
    SET( MACOSX_BUNDLE_LONG_VERSION_STRING "Charm ${Charm_VERSION}" )
    SET( MACOSX_BUNDLE_SHORT_VERSION_STRING "${Charm_VERSION}" )
    SET( MACOSX_BUNDLE_COPYRIGHT "2006-2014 KDAB" )
    SET( MACOSX_BUNDLE_ICON_FILE "Charm.icns" )
    SET( MACOSX_BUNDLE_GUI_IDENTIFIER "com.kdab" )
    SET( MACOSX_BUNDLE_BUNDLE_NAME "Charm" )

    SET( RESOURCES "${CMAKE_CURRENT_BINARY_DIR}/Charm.app/Contents/Resources"	)
    SET( ICON "${ICONS_DIR}/${MACOSX_BUNDLE_ICON_FILE}" )
    FILE( MAKE_DIRECTORY ${RESOURCES} )
    FILE( COPY ${ICON} DESTINATION ${RESOURCES} )
ENDIF()

IF( MSVC )
    SET( Resources_SRCS ${Resources_SRCS} Charm.rc )
ENDIF()

ADD_EXECUTABLE( ${Charm_EXECUTABLE} WIN32 MACOSX_BUNDLE ${Charm_SRCS} ${Resources_SRCS} )
TARGET_LINK_LIBRARIES( ${Charm_EXECUTABLE} CharmApplication CharmCore ${QT_LIBRARIES} )
IF( WIN32 )
    TARGET_LINK_LIBRARIES( ${Charm_EXECUTABLE} Crypt32 )
ENDIF()
MESSAGE( STATUS "Charm will be installed to ${CMAKE_INSTALL_PREFIX}" )

IF( UNIX AND NOT APPLE )
    SET( XDG_APPS_INSTALL_DIR share/applications )
    INSTALL( FILES charmtimetracker.desktop DESTINATION ${XDG_APPS_INSTALL_DIR} )
    INSTALL( FILES Icons/Charm-128x128.png DESTINATION share/icons/hicolor/128x128/apps )
ENDIF()

INSTALL( TARGETS ${Charm_EXECUTABLE} DESTINATION ${BIN_INSTALL_DIR} )
IF( APPLE )
    SET( EXECUTABLE ${Charm_EXECUTABLE}.app )
    set_target_properties( ${Charm_EXECUTABLE} PROPERTIES MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/MacOSXBundleInfo.plist.in )
ELSE()
    SET( EXECUTABLE ${Charm_EXECUTABLE}${CMAKE_EXECUTABLE_SUFFIX} )
ENDIF()

EXECUTE_PROCESS(
    COMMAND ${CMAKE_COMMAND} -E create_symlink ${CMAKE_CURRENT_BINARY_DIR}/${EXECUTABLE} ${Charm_BINARY_DIR}/${EXECUTABLE}
)

# Only support CPack packaging on newer versions of CMake.
IF( NOT "${CMAKE_VERSION}" VERSION_LESS "2.8.4" )
    IF( CMAKE_BUILD_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])" )
        SET( CMAKE_INSTALL_DEBUG_LIBRARIES_ONLY TRUE )
    ENDIF()

    SET( CMAKE_INSTALL_SYSTEM_RUNTIME_DESTINATION "${BIN_INSTALL_DIR}" )
    INCLUDE( InstallRequiredSystemLibraries )

    IF( NOT BIN_INSTALL_DIR STREQUAL "." )
        SET( EXECUTABLE ${BIN_INSTALL_DIR}/${EXECUTABLE} )
    ENDIF()

    IF( WIN32 )
        FIND_PACKAGE( OpenSSL REQUIRED )
        INSTALL( FILES ${OPENSSL_INCLUDE_DIR}/../libeay32.dll ${OPENSSL_INCLUDE_DIR}/../ssleay32.dll
                 DESTINATION ${BIN_INSTALL_DIR} )
    ENDIF()

    IF( APPLE OR WIN32 )
        INCLUDE( DeployQt4 )
        INSTALL_QT4_EXECUTABLE( "${EXECUTABLE}" "qsqlite" )
    ENDIF()
ENDIF()
