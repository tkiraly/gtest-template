COMMON_CFLAGS=-Iinc -g -Wall
CFLAGS=-std=c99 $(COMMON_CFLAGS)
CXXFLAGS=-std=c++17 $(COMMON_CFLAGS)
LDFLAGS=
LDLIBS=-lgtest -pthread

TSTDIR=tests
SRCDIR=src
OBJDIR=obj
BINDIR=bin

SRCS=$(wildcard $(SRCDIR)/*.c)
OBJS=$(subst src,$(OBJDIR),$(SRCS:.c=.o))
TEST_SRC=$(wildcard $(TSTDIR)/*.cpp)

.PHONY: test clean

$(BINDIR)/gtest-template: $(OBJDIR)/main.o $(OBJS) | $(BINDIR)
	$(CC) $^ -o $@ $(LDFLAGS)

$(OBJDIR)/main.o: main.c | $(OBJDIR)
	$(CC) -c $< -o $@ $(CFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) -c $< -o $@ $(CFLAGS)

$(OBJDIR) $(BINDIR):
	mkdir -p $@

$(BINDIR)/tests: $(TEST_SRC) $(OBJS) | $(BINDIR)
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LDFLAGS) $(LDLIBS)

test: $(BINDIR)/tests
	./$^

clean:
	$(RM) -r $(OBJDIR) $(BINDIR)
