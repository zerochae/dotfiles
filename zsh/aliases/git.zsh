alias gpl='gh pl'
alias gil='gh il'
alias gpv='gh pv'
alias giv='gh iv'
alias gco='gh pc'
alias gpo='git push origin $(git b0)'
alias pv='gh pv'
il() {
    issue_list=$(gh issue list --json number,title --limit 1000 | jq -r '.[] | "\(.number) \(.title)"')
    selected_issue=$(echo "$issue_list" | fzf --prompt "issue: " --no-preview --preview-window=up:3:wrap --margin=20,70 --height 50%)
    issue_number=$(echo "$selected_issue" | awk '{print $1}' | tr -d '[:space:]')
    matching_branches=$(git branch | grep "$issue_number")
    if [ -n "$matching_branches" ]; then
        branch_to_switch=$(echo "$matching_branches" | head -n 1)
        branch_to_switch=$(echo "$branch_to_switch" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        echo "$branch_to_switch"
        git sw "$branch_to_switch"
    else
        echo "브런치를 찾을 수 없습니다."
    fi
}
pl() {
    pr_list=$(gh pr list --json number,title --limit 1000 | jq -r '.[] | "\(.number) \(.title)"')
    selected_pr=$(echo "$pr_list" | fzf --prompt "pr: " --no-preview --preview-window=up:3:wrap --margin=20,70 --height 50%)
    pr_number=$(echo "$selected_pr" | awk '{print $1}' | tr -d '[:space:]')
    gh pc "$pr_number"
}
