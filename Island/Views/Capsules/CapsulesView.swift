import SwiftUI

struct CapsulesView: View {
    @StateObject private var viewModel = CapsulesViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: Theme.Spacing.md) {
                filterPicker

                LazyVStack(spacing: Theme.Spacing.md) {
                    ForEach(viewModel.filteredCapsules) { capsule in
                        NavigationLink(value: capsule) {
                            capsuleRow(capsule)
                        }
                    }
                }
            }
            .padding(.horizontal, Theme.Spacing.pagePaddingH)
            .padding(.top, Theme.Spacing.pagePaddingTop)
            .padding(.bottom, Theme.Spacing.pagePaddingBottom)
        }
        .background(Theme.Colors.background)
        .navigationTitle("时光胶囊")
        .navigationDestination(for: TimeCapsule.self) { capsule in
            CapsuleDetailView(capsule: capsule)
        }
        .toolbar {
            NavigationLink(value: "create") {
                Image(systemName: "plus")
            }
        }
        .navigationDestination(for: String.self) { value in
            if value == "create" { CreateCapsuleView() }
        }
        .task { await viewModel.loadCapsules() }
    }

    private var filterPicker: some View {
        Picker("筛选", selection: $viewModel.filter) {
            Text("全部").tag(CapsulesViewModel.CapsuleFilter.all)
            Text("未开启").tag(CapsulesViewModel.CapsuleFilter.locked)
            Text("已开启").tag(CapsulesViewModel.CapsuleFilter.unlocked)
        }
        .pickerStyle(.segmented)
    }

    private func capsuleRow(_ capsule: TimeCapsule) -> some View {
        HStack {
            Image(systemName: capsule.isUnlocked ? "lock.open" : "lock")
                .foregroundColor(capsule.isUnlocked ? Theme.Colors.stampGreen : Theme.Colors.primary)
            VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
                Text(capsule.title)
                    .font(Theme.Typography.body)
                    .lineLimit(1)
                Text(capsule.createdAt.formatted(date: .abbreviated, time: .omitted))
                    .font(Theme.Typography.caption)
                    .foregroundColor(Theme.Colors.textTertiary)
            }
            Spacer()
        }
        .padding(Theme.Spacing.lg)
        .background(Theme.Colors.card)
        .cornerRadius(Theme.Dimensions.cardRadius)
    }
}
