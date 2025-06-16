package logger

import (
	"os"

	"github.com/sirupsen/logrus"
)

type logrusLogger struct {
	entry *logrus.Entry
}

func NewLogger() Logger {
	base := logrus.New()
	base.SetOutput(os.Stdout)
	base.SetFormatter(&logrus.JSONFormatter{})
	base.SetLevel(logrus.InfoLevel)

	return &logrusLogger{
		entry: logrus.NewEntry(base),
	}
}

func (l *logrusLogger) Info(args ...interface{}) {
	l.entry.Info(args...)
}

func (l *logrusLogger) Infof(format string, args ...interface{}) {
	l.entry.Infof(format, args...)
}

func (l *logrusLogger) Error(args ...interface{}) {
	l.entry.Error(args...)
}

func (l *logrusLogger) Errorf(format string, args ...interface{}) {
	l.entry.Errorf(format, args...)
}

func (l *logrusLogger) WithField(key string, value interface{}) Logger {
	return &logrusLogger{entry: l.entry.WithField(key, value)}
}

func (l *logrusLogger) WithFields(fields map[string]interface{}) Logger {
	return &logrusLogger{entry: l.entry.WithFields(fields)}
}
