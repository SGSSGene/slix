#include "slix-index.h"
#include "PackageIndex.h"

#include <clice/clice.h>
#include <filesystem>

namespace {
void app();
auto cli = clice::Argument{ .parent = &cliIndex,
                            .arg    = "init",
                            .desc   = "initializes a new index",
                            .value  = std::filesystem::path{},
                            .cb     = app,
};

void app() {
    auto index = PackageIndex{};
    if (exists(*cli)) {
        throw std::runtime_error{"path " + (*cli).string() + " already exists, abort"};
    }
    if (!std::filesystem::create_directory(*cli)) {
        throw std::runtime_error{"failed creating directory " + (*cli).string() + ", abort"};
    }
    index.storeFile(*cli / "index.db");
}
}
